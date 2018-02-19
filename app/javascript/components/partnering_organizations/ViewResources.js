import _ from 'underscore'
import PropTypes from "prop-types"
import React from "react"
import { Button, Classes, Dialog, Intent } from "@blueprintjs/core"

import { getCSRFToken, getCSRFFieldName } from '../../shared/helpers/form_helpers'
import ResourceModal from '../shared/ResourceModal.js'
import request from '../../shared/requests/request'

class ViewResources extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      resource: {
        file_name: '',
        category: '',
        description: '',
        file: '',
      },
    }
    this.toggleAddResource = this.toggleAddResource.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleChange(event) {
    const resource = this.state.resource
    resource[event.target.name] = event.target.value
    this.setState({ resource: resource })
  }

  handleSubmit(event) {
    event.preventDefault()
    let formData = new FormData()
    formData.append('resource[file]', this.file.files[0], this.file.files[0].name)
    formData.append('resource[file_name]', this.state.resource.file_name)
    formData.append('resource[category]', this.state.resource.category)
    formData.append('resource[description]', this.state.resource.description)
    fetch('/resources', {
      method: 'POST',
      body: formData,
      credentials: 'same-origin',
      headers: {
        "X_CSRF-Token": getCSRFToken()
      }
    }).then((resp) => {
      if (resp.status != 200) {
        alert("There was an error. Try again!")
      }
      window.location.reload()
    })
  }

  toggleAddResource() {
    if (this.state.isOpen == true) {
      this.setState({ isOpen: false })
    } else {
      this.setState({ isOpen: true })
    }
  }

  renderAddResource() {
    return (
      <Dialog
        iconName="pt-icon-add"
        isOpen={this.state.isOpen}
        onClose={this.toggleAddResource}
        title="Add Resource"
      >
        <form action='/resources' method='POST' onSubmit={this.handleSubmit}>
          <div className="pt-dialog-body">
            <p className="pt-ui-text">File Name:
              <input
                value={this.state.resource.file_name}
                onChange={this.handleChange}
                name="file_name"
                type="text"
                className="pt-input"
              />
            </p>
            <p className="pt-ui-text">Category:
              <input
                value={this.state.resource.category}
                onChange={this.handleChange}
                name="category"
                type="text"
                className="pt-input"
              />
            </p>
            <p className="pt-ui-text">Description:
              <textarea
                value={this.state.resource.description}
                onChange={this.handleChange}
                name="description"
                type="text"
                className="pt-input">
              </textarea>
            </p>
            <p className="pt-ui-text">File:
              <input
                name="file"
                role="button"
                type="file"
                ref={input => {this.file = input}}
                className='pt-button-small'
              />
            </p>
            <input
              type='hidden'
              name={getCSRFFieldName()}
              value={getCSRFToken()}
            />
          </div>
          <div className="pt-dialog-footer">
            <div className="pt-dialog-footer-actions">
              <Button
                intent={Intent.SECONDARY}
                type="submit"
                text="Submit"
              />
              <Button
                intent={Intent.PRIMARY}
                onClick={this.toggleAddResource}
                text="Close"
              />
            </div>
          </div>
        </form>
      </Dialog>
    )
  }

  renderResources() {
    return this.props.resources.map((resource) => {
      return (
        <li key={resource.id}>
          <ResourceModal resource={resource} />
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
        <Button className='add-resource-button pt-icon-add pt-large' onClick={this.toggleAddResource}>Add Resources</Button>
        {this.renderAddResource()}
      </div>
    )
  }
}

export default ViewResources
