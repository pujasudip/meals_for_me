import React, {Component} from 'react';

class Recipe extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className='container'>
                <div className='dishPicture'></div>
                <h2>Dish Name</h2>
                <h5>Ready in: 45mins</h5>
                <div className='ingredients'>
                    <ul> <h3>Ingredients</h3>
                        <li>Chicken</li>
                        <li>Beans</li>
                        <li>Rice</li>
                        <li>Salt</li>
                    </ul>
                </div>
                <div className='directions'>
                    <ul> <h3>Instructions</h3>
                        <ol>1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</ol>
                        <ol>2. Quisque et metus ut mauris imperdiet accumsan quis ac ex.</ol>
                        <ol>3. Morbi nec neque urna. Fusce molestie aliquam est sed scelerisque. </ol>
                        <ol>4. Vestibulum dolor est, tincidunt id faucibus in, porta eu felis.</ol>
                    
                    </ul>
                </div>
            </div>
        )
    }
}

export default Recipe;
