import React from "react"
import { Card, Button } from "@blueprintjs/core"

import VeteranModal from '../shared/VeteranModal.js'


class ViewVeterans extends React.Component {
  constructor(props) {
    super(props)
  }

  renderVeterans() {
    return this.props.veterans.map((veteran, i) => {
      return (
        <li key={i}>
          <VeteranModal
            veteran={veteran}
          />
        </li>
      )
    })
  }

  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Veterans Following You</h2>
        <ul>
          {this.renderVeterans()}
        </ul>
      </div>
    )
  }
}

export default ViewVeterans
