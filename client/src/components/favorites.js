import React, { Component } from 'react';
import '../assets/css/favorites.css';


class Favorites extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='body'>
                <div className='indivDish'>
                    <h3>Dish Name</h3>
                    <div className='dishPicture'></div>
                    <div>Trash</div>
                </div>
            </div>
        )
    }
}

export default Favorites;
