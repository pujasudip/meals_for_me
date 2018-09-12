import React, { Component } from 'react';
import '../assets/css/ingredient.css';

class Ingredients extends Component{
    render(){
        return (
            <section className="nutrition">
                <h6 className="center">Ingredients</h6>
                <ul className="ingredientsList">
                    {this.props.ingredients}
                </ul>
            </section>
        );
    }
}

export default Ingredients;