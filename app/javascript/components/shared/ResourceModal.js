import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"
import request from '../../shared/requests/request'


class ResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {}
    this.deleteResource = this.deleteResource.bind(this)
  }

  deleteResource() {
    const path = `/resources/` + this.props.resource.id
    request.delete(path, (response) => {
      window.location.reload()
    }, (error) => {
      alert("There was an error")
    })
  }

  render() {
    return (
      <Card interactive={true} elevation={Card.ELEVATION_TWO}>
        <p>
          File Name: {this.props.resource.file_name}
        </p>
        <p>
          Description: {this.props.resource.description}
        </p>
        <p>
          Created at: {this.props.resource.created_at}
        </p>
        <a href={this.props.resource.file.url}>
          <Button className='show-resource'>
            Show
          </Button>
        </a>
        <Button className='delete-resource' onClick={this.deleteResource}>
          Delete
        </Button>
      </Card>
    )
  }
}

ResourceModal.propTypes = {
  resource: PropTypes.shape({
    id: PropTypes.number.isRequired,
    file_name: PropTypes.string.isRequired,
    created_at: PropTypes.string.isRequired,
  })
}

export default ResourceModal
