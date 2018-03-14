import _ from 'underscore'
import PropTypes from "prop-types"
import React from "react"
import { Button, ButtonGroup, DropdownButton, MenuItem } from 'react-bootstrap'

import AddResourceModal from './AddResourceModal.js'
import ResourceModal from './ResourceModal.js'


class ResourceViewModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      passed_categories: _.invert(this.props.categories),
      passed_sections: _.invert(this.props.sections)
    }
  }

  handleChange(event, s) {
    console.log(event)
    console.log(s)
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

  renderSelect(items) {
    return Object.entries(this.props[items]).map((item) => {
      return (
        <MenuItem key={item[1]} eventKey={item[1]}>{item[0]}</MenuItem>
      )
    })
  }

  render () {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Resources</h2>

        <ButtonGroup id="filters">
          <DropdownButton title="Category" id="bg-nested-dropdown" onSelect={(event) => this.handleChange(event, "category")}>
            {this.renderSelect("categories")}
          </DropdownButton>
          <DropdownButton title="Section" id="bg-nested-dropdown" onSelect={(event) => this.handleChange(event, "section")}>
            {this.renderSelect("sections")}
          </DropdownButton>
        </ButtonGroup>

        <ul id="resource-list">
          {this.renderResources()}
        </ul>
        <AddResourceModal
          categories={this.props.categories}
          sections={this.props.sections}
        />
      </div>
    )
  }
}

export default ResourceViewModal
