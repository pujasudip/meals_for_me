import React, { Component } from 'react';
import '../assets/css/about_us.css';
import Member from './member';

class AboutUs extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <Member/>
        )
    }
}

export default AboutUs;
