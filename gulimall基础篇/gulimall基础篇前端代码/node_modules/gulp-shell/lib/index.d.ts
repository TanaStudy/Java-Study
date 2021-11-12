/// <reference types="node" />
interface Options {
    cwd?: string;
    env?: NodeJS.ProcessEnv;
    shell?: true | string;
    quiet?: boolean;
    verbose?: boolean;
    ignoreErrors?: boolean;
    errorMessage?: string;
    templateData?: object;
}
declare const shell: {
    (commands: string | string[], options?: Options | undefined): NodeJS.ReadWriteStream;
    task(commands: string | string[], options?: Options | undefined): () => Promise<void>;
};
export = shell;
//# sourceMappingURL=index.d.ts.map