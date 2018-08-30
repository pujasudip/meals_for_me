import React, { Component } from 'react';

class ShoppingList extends Component{
    render(){
        return (
            <section className="shopping_list">
                <ul start= '1'>Nutrition
                    <li>Chicken</li>
                    <li>Potato</li>
                    <li>Milk</li>
                    <li>Peanuts</li>
                    <li>Olive Oil</li>
                </ul>
            </section>
        );
    }
}

export default ShoppingList;