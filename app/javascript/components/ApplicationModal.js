import React from 'react'
import PropTypes from "prop-types"
import { Card, Button } from "@blueprintjs/core"


class ResourceModal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
  }

  render() {
    console.log(this.props.application)
    return (
      <Card interactive={true} elevation={Card.ELEVATION_TWO}>
        <p>
          Name: {this.props.application.name}
        </p>
        <p>
          Phone Number: {this.props.application.phone_number}
        </p>
        <p>
          Approval Satus: {this.props.application.approval_status.toString()}
        </p>
        <a href='/'>
          <Button className='approve-po'>
            Approve
          </Button>
        </a>
        <a href='/'>
          <Button className='reject-po'>
            Reject
          </Button>
        </a>
      </Card>
    )
  }
}

ResourceModal.propTypes = {
  application: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    phone_number: PropTypes.string.isRequired,
    approval_status: PropTypes.bool.isRequired,
  })
}

export default ResourceModal
