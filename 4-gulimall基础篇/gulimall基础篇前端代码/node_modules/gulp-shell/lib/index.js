"use strict";
var tslib_1 = require("tslib");
var chalk_1 = tslib_1.__importDefault(require("chalk"));
var child_process_1 = require("child_process");
var fancy_log_1 = tslib_1.__importDefault(require("fancy-log"));
var lodash_template_1 = tslib_1.__importDefault(require("lodash.template"));
var path = tslib_1.__importStar(require("path"));
var plugin_error_1 = tslib_1.__importDefault(require("plugin-error"));
var through2_1 = require("through2");
var PLUGIN_NAME = 'gulp-shell';
var normalizeCommands = function (commands) {
    if (typeof commands === 'string') {
        commands = [commands];
    }
    if (!Array.isArray(commands)) {
        throw new plugin_error_1.default(PLUGIN_NAME, 'Missing commands');
    }
    return commands;
};
var normalizeOptions = function (options) {
    var _a;
    if (options === void 0) { options = {}; }
    var pathToBin = path.join(process.cwd(), 'node_modules', '.bin');
    /* istanbul ignore next */
    var pathName = process.platform === 'win32' ? 'Path' : 'PATH';
    var newPath = pathToBin + path.delimiter + process.env[pathName];
    var env = tslib_1.__assign(tslib_1.__assign(tslib_1.__assign({}, process.env), (_a = {}, _a[pathName] = newPath, _a)), options.env);
    return tslib_1.__assign({ cwd: process.cwd(), env: env, shell: true, quiet: false, verbose: false, ignoreErrors: false, errorMessage: 'Command `<%= command %>` failed with exit code <%= error.code %>', templateData: {} }, options);
};
var runCommand = function (command, options, file) {
    var context = tslib_1.__assign({ file: file }, options.templateData);
    command = lodash_template_1.default(command)(context);
    if (options.verbose) {
        fancy_log_1.default(PLUGIN_NAME + ":", chalk_1.default.cyan(command));
    }
    var child = child_process_1.spawn(command, {
        env: options.env,
        cwd: lodash_template_1.default(options.cwd)(context),
        shell: options.shell,
        stdio: options.quiet ? 'ignore' : 'inherit'
    });
    return new Promise(function (resolve, reject) {
        child.on('exit', function (code) {
            if (code === 0 || options.ignoreErrors) {
                return resolve();
            }
            var context = tslib_1.__assign({ command: command,
                file: file, error: { code: code } }, options.templateData);
            var message = lodash_template_1.default(options.errorMessage)(context);
            reject(new plugin_error_1.default(PLUGIN_NAME, message));
        });
    });
};
var runCommands = function (commands, options, file) { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    var _i, commands_1, command;
    return tslib_1.__generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                _i = 0, commands_1 = commands;
                _a.label = 1;
            case 1:
                if (!(_i < commands_1.length)) return [3 /*break*/, 4];
                command = commands_1[_i];
                return [4 /*yield*/, runCommand(command, options, file)];
            case 2:
                _a.sent();
                _a.label = 3;
            case 3:
                _i++;
                return [3 /*break*/, 1];
            case 4: return [2 /*return*/];
        }
    });
}); };
var shell = function (commands, options) {
    var normalizedCommands = normalizeCommands(commands);
    var normalizedOptions = normalizeOptions(options);
    var stream = through2_1.obj(function (file, _encoding, done) {
        var _this = this;
        runCommands(normalizedCommands, normalizedOptions, file)
            .then(function () {
            _this.push(file);
        })
            .catch(function (error) {
            _this.emit('error', error);
        })
            .finally(done);
    });
    stream.resume();
    return stream;
};
shell.task = function (commands, options) { return function () { return runCommands(normalizeCommands(commands), normalizeOptions(options), null); }; };
module.exports = shell;
//# sourceMappingURL=index.js.map