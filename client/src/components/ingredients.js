import React, { Component } from 'react';

class Ingredients extends Component{
    render(){
        return (
            <section className="nutrition">
                <ul>
                    {this.props.ingredients}
                </ul>
            </section>
        );
    }
}

export default Ingredients;