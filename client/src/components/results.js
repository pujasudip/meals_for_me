import React, { Component } from 'react';
import '../assets/css/results.css'
import lf_image from "../assets/images/leaf_board.png";
import axios from 'axios';
import OneResult from './individual_result_panel';

const BASE_URL = 'http://localhost:8000/data.php';

class Results extends Component {
    constructor(props) {
        super(props);
        this.state = {
            resultArray: ''
        }
    }

    async componentDidMount() {
        // document.body.style.backgroundImage = `url(${lf_image})`;
        const response = await axios.get(BASE_URL);

        this.setState({
            resultArray: response.data
        });
    }

    displayMore(){
        
    }
    render() {
        const resultResponse = this.state.resultArray;

        console.log('result response on result.js:', resultResponse);

        let resultArray = '';
resultResponse.sort
        if(resultResponse){
            resultArray = resultResponse.map((ele, index)=>{
                return (
                    <OneResult key={ele.id} title={ele.title} likes={ele.likes} imageSrc={ele.image}/>
                );
            });
            // for(let recipeIndx = 0; recipeIndx < 10; recipeIndx++){
            //     <OneResult key={ele.id} title={ele.title} likes={ele.likes} imageSrc={ele.image} />
            // };
        }

        return (
            <div>
                {resultArray}
                {/* <button type='text' onClick={this.displayMore}>Display More</button> */}
            </div>
        )
    }
}

export default Results;
