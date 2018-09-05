import React, { Component } from 'react';
import '../assets/css/results.css'
import lf_image from "../assets/images/leaf_board.png";
import axios from 'axios';
import OneResult from './individual_result_panel';
import { connect } from 'react-redux';
import { formatPostData, formatQueryString } from '../helpers';
import { searchedRecipe, setDetailsOfItem } from '../actions';

const BASE_URL = 'http://localhost:8000/server/getData.php';

class Results extends Component {
    constructor(props) {
        super(props);
        this.state = {
            resultArray: ''
        }
    }

    async componentDidMount() {
        this.props.searchedRecipe(this.props.userInputs);
    }

    setDetailsAction(details){
        this.props.setDetailsOfItem(details);
    }

    displayMore(){
        
    }
    render() {
        console.log('inputs:', this.props.userInputs);
        let searchedIngredients = '';
        if(this.props.searchedIngredients){
           searchedIngredients = this.props.searchedIngredients.data.data;
        }

        console.log('result response on result.js:', searchedIngredients);

        let resultArray = '';
        if(searchedIngredients){
            resultArray = searchedIngredients.map((ele, index)=>{
                return (
                    <OneResult key={ele.ID} id={ele.ID} title={ele.Name} details={ele} likes={ele.likes} imageSrc={ele.Image} clickItem={this.setDetailsAction.bind(this)}/>
                );
            });
        }

        return (
            <div>
                {resultArray}
                {/* <button type='text' onClick={this.displayMore}>Display More</button> */}
            </div>
        )
    }
}

function mapStateToProps(state){
    return {
        userInputs: state.search.ingredients,
        searchedIngredients: state.search.searched_recipe
    }
}

export default connect(mapStateToProps, { searchedRecipe, setDetailsOfItem })(Results);