import React from "react"
import PropTypes from "prop-types"
import AnswerDetails from "./AnswerDetails"

// This expects a prop called "answers".
const AnswerList = (props) => (
  <section className="AnswerList">
    <ul>
      {props.answers
        .map(answer=>(
          <AnswerDetails 
            {...answer}
          />
        ))
      }

    </ul>
  
  </section>
)

export default AnswerList
