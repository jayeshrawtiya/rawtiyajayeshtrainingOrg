import { LightningElement } from 'lwc';

export default class NewsApp extends LightningElement {
    sortByOptions = [
        { label: 'Relevance', value: 'relevance' },
        { label: 'Popularity', value: 'popularity' },
        { label: 'Published At', value: 'publishedAt' }
    ];
}