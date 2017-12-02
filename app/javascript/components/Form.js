/**
 * Form object to gather user input and submit to API. This class
 * wraps the tcomb-form library and overrides many styles by default.
 * See below for more details. This form's parent component must use
 * `this.form.getValue()`, which will be set by a ref when the form
 * values are filled out, in order to retrieve the form information
 * and handle submission.
 *
 * @prop style        - style override
 * @prop refCallback  - callback function in order to set a ref on the parent
 *                      to get this form's values. See `LoginScreen` for an
 *                      example
 * @prop type         - object that specifies the form fields and types for
 *                      each field. Again see `LoginScreen` for an example and
 *                      refer to this documentation: https://github.com/gcanti/tcomb-form-native
 * @prop options      - options for customizing each form field, see the docs
 * @prop value        - default values in form
 * @prop onChange     - callback handler called every time the form changes
 */

import React from 'react';
import PropTypes from 'prop-types';
import t from 'tcomb-form';
const TForm = t.form.Form;

class Form extends React.Component {

  constructor(props) {
    super(props);

    this.overrideStyles();
  }

  /**
   * Overrides default styles from form library.
   *
   * To override more defaults refer to the master stylesheet here:
   * https://github.com/gcanti/tcomb-form-native/blob/master/lib/stylesheets/bootstrap.js
   */
  overrideStyles() {
    let stylesheet = t.form.Form.stylesheet;

    const FONT_SIZE = 15;
    const HEIGHT = 40;
    const INPUT_COLOR = colors.charcoal;
    const PADDING_HORIZONTAL = 15;

    const LABEL_FONT_SIZE = 15;
    const LABEL_COLOR = colors.charcoal
    const LABEL_FONT_WEIGHT = 'bold';

    const HELPBLOCK_FONT_SIZE = 13;

    // Textbox styles
    let textbox = stylesheet.textbox;
    textbox.normal = {
      color: INPUT_COLOR,
      backgroundColor: colors.snow,
      fontSize: FONT_SIZE,
      height: HEIGHT,
      paddingVertical: Platform.OS === "ios" ? 7 : 0,
      paddingHorizontal: PADDING_HORIZONTAL,
      borderRadius: HEIGHT / 2,
      borderColor: colors.light_gray,
      borderWidth: 1,
      marginBottom: 5,
    };

    textbox.error = {
      color: INPUT_COLOR,
      backgroundColor: colors.snow,
      fontSize: FONT_SIZE,
      height: HEIGHT,
      paddingVertical: Platform.OS === "ios" ? 7 : 0,
      paddingHorizontal: PADDING_HORIZONTAL,
      borderRadius: HEIGHT / 2,
      borderColor: colors.red,
      borderWidth: 1,
      marginBottom: 5,
    };

    textbox.notEditable = {
      color: INPUT_COLOR,
      backgroundColor: colors.light_gray,
      fontSize: FONT_SIZE,
      height: HEIGHT,
      paddingVertical: Platform.OS === "ios" ? 7 : 0,
      paddingHorizontal: PADDING_HORIZONTAL,
      borderRadius: HEIGHT / 2,
      borderColor: colors.light_charcoal,
      borderWidth: 1,
      marginBottom: 5,
    };

    // Label styles
    let label = stylesheet.controlLabel;
    label.normal = {
      color: LABEL_COLOR,
      fontSize: LABEL_FONT_SIZE,
      marginBottom: 7,
      fontWeight: LABEL_FONT_WEIGHT,
      letterSpacing: 0.5,
    };

    label.error = {
      color: colors.red,
      fontSize: LABEL_FONT_SIZE,
      marginBottom: 7,
      fontWeight: LABEL_FONT_WEIGHT,
      letterSpacing: 0.5,
    };

    // Helpblock styles (help and error messages)
    let helpBlock = stylesheet.helpBlock;
    helpBlock.normal = {
      color: colors.light_gray,
      fontSize: HELPBLOCK_FONT_SIZE,
      marginBottom: 2,
    };
    helpBlock.error = {
      color: colors.red,
      fontSize: HELPBLOCK_FONT_SIZE,
      marginBottom: 2,
    };
    stylesheet.errorBlock = {
      color: colors.red,
      fontSize: HELPBLOCK_FONT_SIZE,
      marginBottom: 2,
    };
  }

  render() {
    return (
      <TForm
        style={[styles.formStyle, this.props.style]}
        ref={this.props.refCallback}
        type={this.props.type}
        options={this.props.options}
        value={this.props.value}
        onChange={this.props.onChange}
      />
    );
  }
}

Form.propTypes = {
  refCallback: PropTypes.func.isRequired,
  options: PropTypes.object,
  value: PropTypes.object,
  onChange: PropTypes.func,
};

export { Form, t };
