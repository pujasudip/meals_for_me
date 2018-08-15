import React, { Component } from 'react';
import '../assets/css/favorites.css';

class Favorites extends Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div className='body'>
                <div className='memberPicture'></div>
                <div className='memberInfo'>
                    <h2>Name: </h2>
                    <h5>LinkedIn</h5>
                    <h5>Github</h5>
                </div>
            </div>
        )
    }
}

export default Favorites;
