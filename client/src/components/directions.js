import React, { Component } from 'react';
import { connect } from 'react-redux';

class Directions extends Component{
    render(){
        const directions = JSON.parse(this.props.directions.Instructions);
        let directionList = '';

        console.log('directions:', directions);

        if(directionList){
            directionList = directions.map((ele, index)=>{
                return <li key={ele.ID}>{ele.name}</li>
            });
        }

        console.log('directionsList:', directionList);


        return (
            <section className="directions">
                <ol start= '1'>Directions
                    {directionList}
                </ol>
            </section>
        );
    }
}

function mapStateToProps(state){
    return {
        directions: state.search.details
    }
}

export default connect(mapStateToProps, {})(Directions);