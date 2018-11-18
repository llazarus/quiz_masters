import React, { Component } from 'react';
import NewQuizForm from './NewQuizForm';
import CreateQuestion from './CreateQuestion';

class CreateQuizPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            quiz: undefined,
            questions: undefined,
            answers: [],
        }
    }
    handleQuizSubmit = (event) => {
        event.preventDefault();
        const title = event.currentTarget.title.value;
        const description = event.currentTarget.description.value;
        const difficulty = event.currentTarget.difficulty.value;
        this.setState({ quiz: { title, description, difficulty } });
        // post to quiz#create getting back quiz and question id
        // use react router to update url with those two ids
    }
    handleQuestionSubmit = (event) => {
        event.preventDefault();
        const title = event.currentTarget.title.value;
        const description = event.currentTarget.description.value;
        this.setState({
            question: {
                title,
                description
            }
        });
        // Post to questions#patch
        // get back new question id and use react-router to update url
    }
    handleAnswersSubmit = (event) => {
        event.preventDefault();
        const answers = [];
        event.currentTarget.querySelectorAll('.answer').forEach((div) => {
            const description = div.querySelector('input[name="description"]').value;
            const correct = div.querySelector('input[name="correct"]').checked;
            const answer = { description, correct };
            answers.push(answer);
        });
        this.setState({ answers });
        // Post to questions#patch
    }
    render() {
        if (!this.state.quiz) {
            return (
                <div>
                    <h1>Create new quiz</h1>
                    <NewQuizForm handleQuizSubmit={this.handleQuizSubmit} />
                </div>
            )
        }
        return (
            <div>
                <CreateQuestion handleQuestionSubmit={this.handleQuestionSubmit} handleAnswersSubmit={this.handleAnswersSubmit} difficulty={this.state.quiz.difficulty} />
            </div>
        )
    }
};

export default CreateQuizPage;