import React from "react"
import PropTypes from "prop-types"


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
