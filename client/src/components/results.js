import React, { Component } from 'react';
import '../assets/css/results.css'
import { Link } from 'react-router-dom';
class Results extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='body'>
                <Link to='/recipe'>
                <div className='indivDish'>
                    <h3>Dish Name</h3>
                    <div className='dishPicture'></div>
                </div>
                </Link>
                <button className="search">Display More</button>
            </div>
        )
    }
}

export default Results;
