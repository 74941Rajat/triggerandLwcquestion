import { LightningElement } from 'lwc';

export default class PortfolioMain extends LightningElement {
    handleScrollToSection(event) {
        const section = event.detail.section;
        const element = this.template.querySelector(`[data-id="${section}"]`);
        if (element) {
            element.scrollIntoView({ behavior: 'smooth' });
        }
    }
}
