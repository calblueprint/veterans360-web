import React from "react"
import { Button, Card, Dialog, Intent } from "@blueprintjs/core"

import request from '../../shared/requests/request'


class ViewCategories extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isOpen: false,
      category: {
        name: '',
      }
    }
    this.toggleAddCategory = this.toggleAddCategory.bind(this)
    this.renderCategory = this.renderCategory.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.submitCategory = this.submitCategory.bind(this)
    this.deleteCategory = this.deleteCategory.bind(this)
  }

  toggleAddCategory() {
    if (this.state.isOpen == true) {
      this.setState({ isOpen: false })
    } else {
      this.setState({ isOpen: true })
    }
  }

  deleteCategory(id) {
    const route = '/categories/' + id
    request.delete(route, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
    })
  }

  handleChange(event) {
    const category = this.state.category
    category[event.target.name] = event.target.value
    this.setState({ category: category })
  }

  submitCategory(event) {
    event.preventDefault()
    const route = `/categories/`
    let params = {
      category: this.state.category,
    }
    request.post(route, params, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
    })
  }

  renderCategory() {
    return this.props.categories.map((category) => {
      return (
        <li key={category.id}>
          <Card interactive={true} elevation={Card.ELEVATION_TWO}>
            <p>
              Name: {category.name}
            </p>
            <Button className="delete-category" onClick={() => this.deleteCategory(category.id)}>
              Delete
            </Button>
          </Card>
        </li>
      )
    })
  }

  renderAddCategory() {
    return (
      <div>
        <Button className='add-resource-button pt-icon-add pt-large' onClick={this.toggleAddCategory}>Add Category</Button>
        <Dialog
          iconName="pt-icon-add"
          isOpen={this.state.isOpen}
          onClose={this.toggleAddCategory}
          title="Add Resource"
        >
          <form action='/categories' method='POST' onSubmit={this.submitCategory}>
            <div className="pt-dialog-body">
              <p className="pt-ui-text">Category Name:
                <input
                  value={this.state.category.name}
                  onChange={this.handleChange}
                  name="name"
                  type="text"
                  className="pt-input"
                  required
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
                  onClick={this.toggleAddCategory}
                  text="Close"
                />
              </div>
            </div>
          </form>
        </Dialog>
      </div>
    )
  }

  render() {
    return (
      <div className='container'>
        <h2 className='container-header'>List of Categories</h2>
        <ul>
          {this.renderCategory()}
        </ul>
        {this.renderAddCategory()}
      </div>
    )
  }
}

export default ViewCategories
