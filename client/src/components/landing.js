import React, { Component } from 'react';
import '../assets/css/landing.css';
import plus from '../assets/images/plus.png';
import minus from '../assets/images/minus.png';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { searchIngredient } from '../actions';

class LandingPage extends Component {
    commonIngredientsRef = ['Beef', 'Chicken', 'Salmon', 'Shrimp', 'Crab', 'Potato', 'fish'];

    constructor(props) {
        super(props);
        this.state = {
            currentIngredientInput: '',
            ingredients: [],
            commonIngredients: ['Beef', 'Chicken', 'Salmon', 'Shrimp', 'Crab', 'Potato', 'fish']
        };
    }

    userInputHandler(event) {
        this.setState({
            currentIngredientInput: event.target.value
        });
    }

    addIngredientToList(item) {
        if (item.target) {
            item = this.state.currentIngredientInput;
        }

        const newCommonIngredients = this.state.commonIngredients;
        const index = newCommonIngredients.indexOf(item);
        newCommonIngredients.splice(index, 1);

        this.setState({
            currentIngredientInput: '',
            ingredients: [...this.state.ingredients, item],
            commonIngredients: newCommonIngredients
        });

    }

    removeFromTheIngredient(index) {
        const newList = this.state.ingredients;
        const item = newList.splice(index, 1);
        let newCommonItems = '';
        console.log('aa:', item);
        if(this.commonIngredientsRef.includes(item[0])){
            newCommonItems = this.state.commonIngredients;
            newCommonItems.splice(0, 0, item);
        }

        this.setState({
            ingredients: newList
        });
    }

    render() {
        const ingredient = this.state.ingredients.map((item, index) => {
            console.log('ITEM:', item);
            return (<div key={index}><input className='userInput' value={item} readOnly />
                <img id="ingAdd" src={minus} alt='' onClick={() => this.removeFromTheIngredient(index)} />
            </div>);
        });

        const commonIngredientsBtns = this.state.commonIngredients.map((item, index) => {
            return (<button onClick={() => this.addIngredientToList(item)} key={index}>{item}</button>)
        });

        return (
            <div className='container'>
                <div className='menu-banner'>
                    <h2>What to Food</h2>
                </div>
                {this.state.ingredients.length < 3 ?
                    <div>
                        <input className='userInput' onChange={(event) => this.userInputHandler(event)} value={this.state.currentIngredientInput} />
                        <img id="ingAdd" src={plus} onClick={this.addIngredientToList.bind(this)} />
                    </div>
                    :
                    <div><h5>Go for the food</h5></div>
                }
                <div>
                    {ingredient}
                </div>
                <div>
                    <button id="landPgSearchBtn"
                        type='button'><Link to='/result'>Search</Link></button>
                </div>
                {this.state.ingredients.length < 3 ?
                    <div className="ingredientBtns">
                        {commonIngredientsBtns}
                    </div>
                    : ''
                }
            </div>
        );
    }
}

function mapStateToProps(state){
    return {
        src: state.search.userI,
    }

}

export default connect(mapStateToProps, { searchIngredient: searchIngredient})(LandingPage);