import React, { Component } from 'react';
import '../assets/css/landing.css'

class Landing extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='body'>
                <h3>Ingredients</h3>
                <div className='inputField'>
                    <input type="text" placeholder='insert upto 3' className='inputField'></input>
                    <button type='submit'>+</button>  
                </div>
                <div className='ingredientButton'>
                    <div>beef</div>
                    <div>chicken</div>
                    <div>pork</div>
                    <div>seafood</div>
                    <div>vegi</div>
                </div>
                <button className="search">Search</button>
            </div>
        )
    }
}

export default Landing;
