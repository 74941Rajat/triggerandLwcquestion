import { LightningElement } from 'lwc';

export default class PortfolioProjects extends LightningElement {
    projects = [
        {
            icon: 'utility:home',
            iconClass: 'icon-container primary-gradient',
            title: 'Real Estate Construction Rate Analysis',
            description: 'Built a comprehensive Salesforce CRM solution for Material-to-Quota processes with optimized lead & opportunity tracking.',
            highlights: [
                'Customized objects, validation rules, and workflows',
                'Created Apex triggers and LWC components for improved UI',
                'Ensured smooth data migration with strong test coverage'
            ],
            tags: ['Apex', 'LWC', 'Data Migration', 'Sales Cloud']
        },
        {
            icon: 'utility:retail_execution',
            iconClass: 'icon-container accent-gradient',
            title: 'B2C Sales Cloud Implementation',
            description: 'Implemented CRM solution for Vedic Services & Products, an Ayurvedic service organization.',
            highlights: [
                'Created Web-to-Lead integration for patient referrals',
                'Built custom Lightning Web Runtime page',
                'Automated processes with Flows & Approval Processes'
            ],
            tags: ['Web-to-Lead', 'LWR', 'Flows', 'Automation']
        },
        {
            icon: 'utility:money',
            iconClass: 'icon-container mixed-gradient',
            title: 'Loan Collection Application (NBFC)',
            description: 'Designed a comprehensive loan management system on Salesforce platform for financial services.',
            highlights: [
                'Built custom loan tracking workflows',
                'Implemented collection process automation',
                'Created dashboards for portfolio management'
            ],
            tags: ['Financial Services', 'Custom Objects', 'Workflows']
        },
        {
            icon: 'utility:store',
            iconClass: 'icon-container accent-secondary-gradient',
            title: 'Sales Cloud at Sobeys',
            description: 'Led CRM deployment to improve sales processes & customer engagement for retail operations.',
            highlights: [
                'Automated lead tracking and sales forecasting',
                'Integrated CRM with ERP and online store systems',
                'Built custom LWCs and Apex triggers'
            ],
            tags: ['Integration', 'ERP', 'LWC', 'Retail']
        }
    ];
}
