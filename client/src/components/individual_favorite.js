import React, { Component } from 'react';
import '../assets/css/favorites.css';
import {Link} from "react-router-dom";


class InvidualFavorite extends Component{
    constructor(props){
        super(props);
    }


    render(){
        return (
            <div className='center-block card-panel'>
                <Link to = '/recipe'>
                    <div className='indivDish'>
                        <h3>Dish Name</h3>
                        <div className='dishPicture'></div>
                        <i className="medium material-icons red-text">delete</i>
                    </div>
                </Link>
            </div>
        );
    }
}

export default InvidualFavorite;