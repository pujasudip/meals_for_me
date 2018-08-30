import React, { Component } from 'react';
import '../assets/css/favorites.css';
import IndividualFavorite from './individual_favorite';

class Favorites extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <IndividualFavorite />
                <IndividualFavorite />
                <IndividualFavorite />
                <IndividualFavorite />
                <IndividualFavorite />
            </div>
        )
    }
}

export default Favorites;
