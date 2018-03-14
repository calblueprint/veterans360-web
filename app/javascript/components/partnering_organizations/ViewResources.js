import React from "react"

import ResourceViewModal from '../shared/ResourceViewModal.js'

class ViewResources extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <ResourceViewModal
        categories={this.props.categories}
        sections={this.props.sections}
        resources={this.props.resources}
      />
    )
  }
}

export default ViewResources
