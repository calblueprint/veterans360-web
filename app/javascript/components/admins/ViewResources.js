import _ from 'underscore'
import PropTypes from "prop-types"
import React from "react"

import ResourceModal from '../shared/ResourceModal.js'


class ViewResources extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      resources: [],
      passed_categories: _.invert(this.props.categories),
      passed_sections: _.invert(this.props.sections)
    }
  }

  renderResources() {
    return this.props.resources.map((resource) => {
      return (
        <li key={resource.id}>
          <ResourceModal
            resource={resource}
            categories={this.state.passed_categories}
            sections={this.state.passed_sections}
          />
        </li>
      )
    })
  }

  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Resources</h2>
        <ul>
          {this.renderResources()}
        </ul>
      </div>
    )
  }
}

export default ViewResources
