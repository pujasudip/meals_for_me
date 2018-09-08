import React, { Component } from 'react';
import { connect } from 'react-redux';

class Directions extends Component{
    render(){
        const directions = JSON.parse(this.props.directions.Instructions)[0].steps;
        let directionList = '';

        // console.log('directions:', directions);

        if(directions){
            let directionListArray = directions.map((ele, index)=>{
                return ele.step;
            });
            directionListArray = directionListArray.join('');
            directionListArray = directionListArray.split('.');
            directionList = directionListArray.map((ele, index)=>{
                return <li key={index}>{ele}</li>;
            });

        }

        return (
            <div className="directions">
                <h4>Directions</h4>
                <ul>
                    {directionList}
                </ul>
            </div>
        );
    }
}

function mapStateToProps(state){
    return {
        // directions: state.search.details
    }
}

export default connect(mapStateToProps, {})(Directions);