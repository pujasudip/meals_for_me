import React, { Component } from 'react';
import '../assets/css/results.css'

class Results extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='body'>
                <div className='indivDish'>
                    <h3>Dish Name</h3>
                    <div className='dishPicture'></div>
                </div>
                <button className="search">Display More</button>
            </div>
        )
    }
}

export default Results;
