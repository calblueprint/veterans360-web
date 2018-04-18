import _ from 'underscore'
import PropTypes from "prop-types"
import React from "react"

import AddResourceModal from './AddResourceModal.js'
import ResourceModal from './ResourceModal.js'


class ResourceViewModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
  }

  renderResources() {
    return this.props.resources.map((resource) => {
      return (
        <li key={resource.id}>
          <ResourceModal
            resource={resource}
          />
        </li>
      )
    })
  }


  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Resources</h2>
        <ul id="resource-list">
          {this.renderResources()}
        </ul>
        <AddResourceModal />
      </div>
    )
  }
}

export default ResourceViewModal
