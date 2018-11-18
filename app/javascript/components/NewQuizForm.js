import React from 'react';

const NewQuizForm = (props) => (
    <form onSubmit={props.handleQuizSubmit}>
        <div>
            <label htmlFor="title">Title</label> <br />
            <input type="text" name="title" />
        </div>
        <div>
            <label htmlFor="description">Description</label> <br />
            <textarea name="description" id="description" cols="50" rows="5"></textarea>
        </div>
        <div>
            <label htmlFor="difficulty">Difficulty</label> <br />
            <input type="radio" name="difficulty" value="3" /> Easy
            <input type="radio" name="difficulty" value="5" defaultChecked /> Medium
            <input type="radio" name="difficulty" value="7" /> Hard
        </div>
        <button>Create Quiz</button>
    </form>
);

export default NewQuizForm;
