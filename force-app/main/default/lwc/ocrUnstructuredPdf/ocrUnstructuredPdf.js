import { LightningElement, track } from 'lwc';
import processUnstructuredPDF from '@salesforce/apex/EinsteinOCRService.processUnstructuredPDF';

export default class OcrUnstructuredPdf extends LightningElement {
    @track ocrText = [];

    handleFileChange(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = () => {
                let base64 = reader.result.split(',')[1];
                processUnstructuredPDF({ base64Data: base64, fileName: file.name })
                    .then(result => {
                        let parsed = JSON.parse(result);
                        this.ocrText = parsed.probabilities[0].fields.map(f => f.value);
                        console.log('Extracted Text:', this.ocrText);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            };
            reader.readAsDataURL(file);
        }
    }
}