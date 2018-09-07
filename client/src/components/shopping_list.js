import React, { Component } from 'react';
import { connect } from 'react-redux';

class ShoppingList extends Component{
    render(){
        console.log('shop:', this.props.shoppingList);
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

function mapStateToProps(state){
    return {
        shoppingList: state.shoppingList
    }
}

export default connect(mapStateToProps, {})(ShoppingList);