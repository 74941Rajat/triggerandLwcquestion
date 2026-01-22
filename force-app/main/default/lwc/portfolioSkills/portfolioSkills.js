import { LightningElement } from 'lwc';

export default class PortfolioSkills extends LightningElement {
    skillCategories = [
        {
            icon: 'utility:salesforce1',
            iconClass: 'icon-container primary-gradient',
            title: 'Salesforce Development',
            skills: ['Apex', 'Visualforce', 'Lightning Web Components', 'Sales Cloud']
        },
        {
            icon: 'utility:layers',
            iconClass: 'icon-container accent-gradient',
            title: 'LWC Expertise',
            skills: ['Decorators', 'Component Communication', 'Lifecycle Hooks', 'LMS', 'DataTable', 'LDS']
        },
        {
            icon: 'utility:connected_apps',
            iconClass: 'icon-container mixed-gradient',
            title: 'Integrations',
            skills: ['REST APIs', 'SOAP APIs', 'JSON', 'XML', 'Third-party Systems']
        },
        {
            icon: 'utility:shield',
            iconClass: 'icon-container accent-secondary-gradient',
            title: 'Security',
            skills: ['Validation Rules', 'Profiles', 'Permission Sets', 'OWD', 'Role Hierarchy', 'Sharing Rules']
        },
        {
            icon: 'utility:flow',
            iconClass: 'icon-container primary-accent-gradient',
            title: 'Declarative Tools',
            skills: ['Lightning Flow', 'Process Builder', 'Workflow Rules', 'Approval Processes']
        },
        {
            icon: 'utility:merge',
            iconClass: 'icon-container accent-primary-gradient',
            title: 'DevOps',
            skills: ['Git', 'Copado', 'Bitbucket', 'GitHub', 'Jira']
        },
        {
            icon: 'utility:bug',
            iconClass: 'icon-container primary-gradient',
            title: 'Testing & QA',
            skills: ['Apex Test Classes', 'UAT', 'Code Coverage', 'Debugging']
        },
        {
            icon: 'utility:database',
            iconClass: 'icon-container accent-gradient',
            title: 'Data Management',
            skills: ['Data Loader', 'Workbench', 'SOQL', 'SOSL']
        }
    ];

    programmingLanguages = ['Apex', 'JavaScript', 'Java', 'HTML', 'CSS', 'XML'];
}
