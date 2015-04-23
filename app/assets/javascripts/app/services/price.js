app.filter('price', function () {
    return function (val) {
        if (!val) return val;

        var digits = ("" + val).split('');
        var result = [];

        if (digits.length > 3) {
            digits = digits.reverse();
            for (var i = 0, len = digits.length; i < len; i++) {
                if ((i !== 0) && (i % 3 === 0)) result.push(' ');
                result.push(digits[i]);
            }

            return result.reverse().join('');
        }
        else return val;
    };
});