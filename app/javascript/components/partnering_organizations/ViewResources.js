import _ from 'underscore'
import PropTypes from "prop-types"
import React from "react"
import { Button, Classes, Dialog, Intent } from "@blueprintjs/core"

import { getCSRFFieldName, getCSRFToken } from '../../shared/helpers/form_helpers'
import ResourceModal from '../shared/ResourceModal.js'
import request from '../../shared/requests/request'

class ViewResources extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      resources: [],
      // formFields: this.getInitialForm(),
    }
    this.toggleAddResource = this.toggleAddResource.bind(this)
    this.createResource = this.createResource.bind(this)
  }

  /* getInitialForm() {
    return {
      file_name: {
        value: '',
        onChange: _.bind(this.handleChange, this, 'file_name'),
      },
      category: {
        value: '',
        onChange: _.bind(this.handleChange, this, 'category'),
      },
      file: {
        value: '',
        onChange: _.bind(this.handleChange, this, 'file'),
      }
    }
  } */

  createResource(e) {
    console.log(e)
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
        <form action='/resources' method='POST' onSubmit={this.createResource}>
          <div className="pt-dialog-body">
            <p className="pt-ui-text">File Name: <input name="file_name" type="text" className="pt-input"></input></p>
            <p className="pt-ui-text">Category: <input name="category" type="text" className="pt-input"></input></p>
            <p className="pt-ui-text">Description: <textarea name="description" type="text" className="pt-input"></textarea></p>

          <p className="pt-ui-text">File: <input name="file" role="button" type="file" className='pt-button-small'></input></p>
            <input
              type='hidden'
              name={getCSRFFieldName()}
              value={getCSRFToken()} />
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
