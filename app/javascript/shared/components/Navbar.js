/**
 * Navigation bar for student and admin side
 *
 * @prop bundleType  - either 'admin', 'student', or 'courseEdit' depending on the Webpack bundle currently loaded
 */
import _ from 'underscore'
import React from 'react'

class Navbar extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      activeIndex: null,
      // user: getUser(),
    }

    this.setActiveChild = this.setActiveChild.bind(this)
    this.resetActiveChild = this.resetActiveChild.bind(this)
    this.renderTab = this.renderTab.bind(this)
  }

  getActiveStyle(i) {
    return i === this.state.activeIndex ? 'nav-element-container active' : 'nav-element-container'
  }

  setActiveChild(i) {
    this.setState({ activeIndex: i })
  }

  resetActiveChild() {
    this.setState({ activeIndex: null })
  }

  renderTab(child, i) {
    return (
      <div
        className={this.getActiveStyle(i)}
        key={i}
      >
        <div onClick={_.partial(this.setActiveChild, i)}>
          {child}
        </div>
      </div>
    )
  }

  renderChildren() {
    console.log(this.props.children)
    if (_.isArray(this.props.children)) {
      return this.props.children.map(this.renderTab)
    } else if (_.isObject(this.props.children)) {
      return this.renderTab(this.props.children, 0)
    }
  }

  render() {
    return (
      <nav className='nav'>
        <div className='flex center'>
          <div className='container'>
            "hi"
          </div>
        </div>
      </nav>
    )
  }
}

export default Navbar
