import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"
import request from '../shared/requests/request'


class ResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
  }

  render() {
    return (
      <Card interactive={true} elevation={Card.ELEVATION_TWO}>
        <p>
          File Name: {this.props.resource.file_name}
        </p>
        <a href={this.props.resource.file.url}>
          <Button className='show-resource'>
            Show
          </Button>
        </a>
        <a href={`/resources/` + this.props.resource.id} data-method="delete" data-confirm="Are you sure">
          <Button className='delete-resource'>
            Delete
          </Button>
        </a>
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
