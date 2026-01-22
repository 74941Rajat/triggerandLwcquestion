import { LightningElement } from 'lwc';

export default class PortfolioHero extends LightningElement {
    certifications = [
        '4X Salesforce Certified',
        '1.5+ Years Experience',
        'Agentforce Expert'
    ];

    scrollToSkills() {
        // Dispatch event for parent to handle navigation
        this.dispatchEvent(new CustomEvent('scrolltosection', {
            detail: { section: 'skills' }
        }));
    }
}
