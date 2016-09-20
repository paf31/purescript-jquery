/* global exports */
"use strict";

exports.ready = function(func) {
    return function() {
        jQuery(document).ready(func);
    };
};

exports.select = function(selector) {
    return function() {
        return jQuery(selector);
    };
};

exports.find = function(selector) {
    return function(ob) {
        return function() {
            return ob.find(selector);
        };
    };
};

exports.parent = function(ob) {
    return function() {
        return ob.parent();
    };
};

exports.closest = function(selector) {
    return function(ob) {
        return function() {
            return ob.closest(selector);
        };
    };
};

exports.create = function(html) {
    return function() {
        return jQuery(html);
    };
};

exports.setAttr = function(attr) {
    return function(val) {
        return function(ob) {
            return function() {
                ob.attr(attr, val);
            };
        };
    };
};

exports.attr = function(attrs) {
    return function(ob) {
        return function() {
            ob.attr(attrs);
        };
    };
};

exports.css = function(props) {
    return function(ob) {
        return function() {
            ob.css(props);
        };
    };
};

exports.hasClass = function(cls) {
    return function(ob) {
        return function() {
            return ob.hasClass(cls);
        };
    };
};

exports.toggleClass = function(cls) {
    return function(ob) {
        return function() {
            ob.toggleClass(cls);
        };
    };
};

exports.setClass = function(cls) {
    return function(flag) {
        return function(ob) {
            return function() {
                ob.toggleClass(cls, flag);
            };
        };
    };
};

exports.setProp = function(p) {
    return function(val) {
        return function(ob) {
            return function() {
                ob.prop(p, val);
            };
        };
    };
};

exports.getProp = function(p) {
    return function(ob) {
        return function() {
            return ob.prop(p);
        };
    };
};

exports.append = function(ob1) {
    return function(ob) {
        return function() {
            ob.append(ob1);
        };
    };
};

exports.appendText = function(s) {
    return function(ob) {
        return function() {
            ob.append(s);
        };
    };
};

exports.body = function() {
    return jQuery(document.body);
};

exports.remove = function(ob) {
    return function() {
        ob.remove();
    };
};

exports.clear = function(ob) {
    return function() {
        ob.empty();
    };
};

exports.before = function(ob) {
    return function(ob1) {
        return function() {
            ob1.before(ob);
        };
    };
};

exports.getText = function(ob) {
    return function() {
        return ob.text();
    };
};

exports.setText = function(text) {
    return function(ob) {
        return function() {
            ob.text(text);
        };
    };
};

exports.getHtml = function(ob) {
    return function() {
        return ob.html();
    };
};

exports.setHtml = function(html) {
    return function(ob) {
        return function() {
            ob.html(html);
        };
    };
};

exports.getValue = function(ob) {
    return function() {
        return ob.val();
    };
};

exports.setValue = function(val) {
    return function(ob) {
        return function() {
            ob.val(val);
        };
    };
};

exports.toggle = function(ob) {
    return function() {
        ob.toggle();
    };
};

exports.setVisible = function(flag) {
    return function(ob) {
        return function() {
            ob.toggle(flag);
        };
    };
};

exports.on = function(evt) {
    return function(act) {
        return function(ob) {
            return function() {
                ob.on(evt, function(e) {
                    act(e)(jQuery(this))();
                });
            };
        };
    };
};

exports["on'"] = function(evt) {
    return function(sel) {
        return function(act) {
            return function(ob) {
                return function() {
                    ob.on(evt, sel, function(e) {
                        act(e)(jQuery(this))();
                    });
                };
            };
        };
    };
};

exports.toArray = function(ob) {
    return function() {
        return ob.toArray().map(function(a) { return jQuery(a); });
    };
};

exports.preventDefault = function(e) {
    return function() {
        e.preventDefault();
    };
};

exports.stopPropagation = function(e) {
    return function() {
        e.stopPropagation();
    };
};

exports.stopImmediatePropagation = function(e) {
    return function() {
        e.stopImmediatePropagation();
    };
};
