import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/favorites.css';

class Favorites extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='body'>
                <Link to = '/recipe'>
                    <div className='indivDish'>
                        <h3>Dish Name</h3>
                        <div className='dishPicture'></div>
                        <div>Trash</div>
                    </div>
                </Link>
            </div>
        )
    }
}

export default Favorites;
