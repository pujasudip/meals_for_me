import React, { Component } from 'react';
import '../assets/css/results.css'
import lf_image from "../assets/images/leaf_board.png";
import axios from 'axios';
import OneResult from './individual_result_panel';
import { connect } from 'react-redux';
import { formatPostData, formatQueryString } from '../helpers';
import { searchedRecipe } from '../actions';

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

    displayMore(){
        
    }
    render() {
        console.log('inputs:', this.props.userInputs);
        console.log('searched: ', this.props.searchedIngredients)

        // console.log('result response on result.js:', resultResponse);

        let resultArray = '';
        // if(resultResponse){
        //     resultArray = resultResponse.map((ele, index)=>{
        //         return (
        //             <OneResult key={ele.id} title={ele.title} likes={ele.likes} imageSrc={ele.image}/>
        //         );
        //     });
            // for(let recipeIndx = 0; recipeIndx < 10; recipeIndx++){
            //     <OneResult key={ele.id} title={ele.title} likes={ele.likes} imageSrc={ele.image} />
            // };
        // }

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

export default connect(mapStateToProps, { searchedRecipe })(Results);
