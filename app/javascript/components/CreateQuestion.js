import React from 'react';
import NewQuestionForm from './NewQuestionForm';
import AnswersForm from './AnswersForm';

const CreateQuestion = (props) => {
    const submitForms = () => {
        document.getElementById('questionForm').dispatchEvent(new Event('submit'));
        document.getElementById('answersForm').dispatchEvent(new Event('submit'));
    }
    return (
        <div>
            <h2>Add a question</h2>
            <NewQuestionForm handleQuestionSubmit={props.handleQuestionSubmit} />
            <h3>Add answers</h3>
            <AnswersForm handleAnswersSubmit={props.handleAnswersSubmit} difficulty={props.difficulty} />
            <button onClick={submitForms}>Create new Question</button>
            <button onClick={submitForms}>Submit quiz</button>
            <button>Discard quiz</button>
        </div>
    )
};

export default CreateQuestion;
