export default function foo(a: number): number {
  return a + 1;
}

export function titleCase(a: string) {
  return a[0].toUpperCase() + a.slice(1);
}

foo(6);

const helloWorld = (param: string): string => {
  return param + " says hello world";
};

console.log(helloWorld(titleCase("simon")));

console.log("hello");
