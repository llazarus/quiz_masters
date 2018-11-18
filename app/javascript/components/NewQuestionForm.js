import React from 'react';

const NewQuestionForm = (props) => (
    <form onSubmit={props.handleQuestionSubmit} id="questionForm">
        <div>
            <label htmlFor="title">Title</label> <br />
            <input type="text" name="title" />
        </div>
        <div>
            <label htmlFor="description">Description</label> <br />
            <textarea name="description" id="description" cols="50" rows="5"></textarea>
        </div>
    </form>
);

export default NewQuestionForm;
