import React from "react";
import PropTypes from "prop-types";
import AnswerList from "./AnswerList";
import { Question, Session } from "../requests";

class QuestionShow extends React.Component {

  constructor(props) {
    super(props);
    console.log(props);

    // First `if` is for when we think
    if (props) {
      this.state = {
        loading: true,
        question: props.question
      }
    } else {

      const id = 
      this.state = {
        loading: true,
        question: 
      }
    }

  }


  render () {
    return (
      <main className="QuestionShow">

        <AnswerList 
          answers={this.state.question.answers}
        />
      </main>

      <React.Fragment>
      </React.Fragment>
    );
  }
}

export default QuestionShow
