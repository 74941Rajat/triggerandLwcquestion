import { LightningElement, track } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';

// Load pdf.js and tesseract.js from static resources
import pdfjsLib from '@salesforce/resourceUrl/pdfjs';
import tesseractLib from '@salesforce/resourceUrl/tesseract';

export default class OcrTest extends LightningElement {
    @track extractedText = '';
    @track isProcessing = false;

    pdfLibInitialized = false;

    renderedCallback() {
        if (!this.pdfLibInitialized) {
            Promise.all([
                loadScript(this, pdfjsLib),          // pdf.js uploaded as single file
                loadScript(this, tesseractLib)       // tesseract.min.js uploaded as single file
            ]).then(() => {
                this.pdfLibInitialized = true;
                console.log('PDF.js and Tesseract.js loaded');
            }).catch(error => {
                console.error('Error loading libraries', error);
            });
        }
    }

    handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
            this.isProcessing = true;
            const reader = new FileReader();
            reader.onload = async (e) => {
                const typedarray = new Uint8Array(e.target.result);

                const pdf = await window['pdfjsLib'].getDocument(typedarray).promise;
                let finalText = '';

                for (let i = 1; i <= pdf.numPages; i++) {
                    const page = await pdf.getPage(i);
                    const viewport = page.getViewport({ scale: 1.5 });

                    const canvas = document.createElement('canvas');
                    const context = canvas.getContext('2d');
                    canvas.height = viewport.height;
                    canvas.width = viewport.width;

                    await page.render({ canvasContext: context, viewport }).promise;

                    const result = await window['Tesseract'].recognize(canvas, 'eng');
                    finalText += `\n--- Page ${i} ---\n${result.data.text}\n`;
                }

                this.extractedText = finalText;
                this.isProcessing = false;
            };
            reader.readAsArrayBuffer(file);
        }
    }
}