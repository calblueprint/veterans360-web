import PropTypes from "prop-types"
import React from "react"
import { Button, Dialog, Intent } from "@blueprintjs/core"

import { getCSRFToken } from '../../shared/helpers/form_helpers'

class AddResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      resource: {
        file_name: '',
        category: 1,
        description: '',
        section: 0,
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
    formData.append('resource[section]', this.state.resource.section)
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

  renderCategories() {
    return Object.entries(this.props.categories).map((category) => {
      return (
        <option key={category[1]} value={category[1]}>{category[0]}</option>
      )
    })
  }

  renderSections() {
    return Object.entries(this.props.sections).map((section) => {
      return (
        <option key={section[1]} value={section[1]}>{section[0]}</option>
      )
    })
  }

  render() {
    return (
      <div>
        <Button className='add-resource-button pt-icon-add pt-large' onClick={this.toggleAddResource}>Add Resources</Button>
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
                <select
                  value={this.state.resource.category}
                  onChange={this.handleChange}
                  name="category"
                  className="pt-input"
                >
                  {this.renderCategories()}
                </select>
              </p>
              <p className="pt-ui-text">Section:
              <select
                  value={this.state.resource.section}
                  onChange={this.handleChange}
                  name="section"
                  className="pt-input"
                >
                  {this.renderSections()}
                </select>
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
      </div>
    )
  }
}

export default AddResourceModal
