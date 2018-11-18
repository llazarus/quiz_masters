import React, { Component } from 'react';
import NewQuizForm from './NewQuizForm';
import CreateQuestion from './CreateQuestion';

class CreateQuizPage extends Component {
    constructor(props) {
        super(props);
        this.handleQuizSubmit = this.handleQuizSubmit.bind(this);
        this.state = {
            quiz: undefined,
            questions: undefined,
            answers: [],
        }
    }
    handleQuizSubmit(event) {
        event.preventDefault();
        const title = event.currentTarget.title.value;
        const description = event.currentTarget.description.value;
        const difficulty = event.currentTarget.difficulty.value;
        this.setState({ quiz: { title, description, difficulty } });
        fetch('/quizzes', {
            method: 'POST',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ quiz: { title, description, difficulty, points: 40 } })
        }).then(res => res.json()).then((data) => {
            const { quizID, questionID } = data;
            this.props.history.push(`/quizzes/${quizID}/questions/${questionID}`)
        });
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
        const { quizID, questionID } = this.props.match.params;
        fetch(`/quzzes/${quizID}/questions/${questionID}`, {
            method: 'PUT',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ question: { title, description } })
        }).then(res => res.json()).then((data) => {
            const { quizID, questionID } = data;
            this.props.history.push(`/quizzes/${quizID}/questions/${questionID}`)
        });
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