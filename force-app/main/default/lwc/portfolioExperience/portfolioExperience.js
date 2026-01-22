import { LightningElement } from 'lwc';

export default class PortfolioExperience extends LightningElement {
    experiencesData = [
        {
            title: 'Salesforce Developer',
            company: 'Primus Techsystem Pvt. Ltd.',
            period: 'April 2025 – Present',
            type: 'Full-time',
            highlights: [
                'Developed and deployed custom Salesforce CRM applications tailored to client business requirements',
                'Designed Lead Management processes and customized standard objects',
                'Built custom objects, Apex triggers, Visualforce pages, and Lightning Web Components',
                'Created multiple Agentforce agents and published them using embedded channels'
            ]
        },
        {
            title: 'Salesforce Developer (Freelance)',
            company: 'Marquery Technologies Pvt. Ltd.',
            period: 'Nov 2024 – Feb 2025',
            type: 'Freelance',
            highlights: [
                'Implemented Salesforce CRM solutions to streamline lead and opportunity management',
                'Customized standard and custom objects, validation rules, and workflows',
                'Built Apex triggers, LWC, and Visualforce for enhanced user experience',
                'Delivered production-ready deployments with optimized test class coverage'
            ]
        },
        {
            title: 'Salesforce Intern',
            company: 'Premium Learning Systems',
            period: 'Nov 2023 – May 2024',
            type: 'Internship',
            highlights: [
                'Supported Salesforce application development and administration',
                'Assisted in data migration using Data Loader & Workbench',
                'Gained practical knowledge of configuration and customization',
                'Built hands-on projects including custom Lightning Web Runtime pages'
            ]
        }
    ];

    get experiences() {
        return this.experiencesData.map((exp, index) => {
            const isEven = index % 2 === 0;
            return {
                ...exp,
                containerClass: `timeline-item ${isEven ? 'timeline-left' : 'timeline-right'}`,
                contentClass: `timeline-content ${isEven ? 'content-left' : 'content-right'}`,
                headerClass: `experience-header ${isEven ? 'header-right' : 'header-left'}`,
                metaClass: `experience-meta ${isEven ? 'meta-right' : 'meta-left'}`,
                listClass: `highlights-list ${isEven ? 'list-right' : 'list-left'}`,
                listItemClass: `highlight-item ${isEven ? 'item-reverse' : ''}`
            };
        });
    }
}
