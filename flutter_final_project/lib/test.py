import time
import speech_recognition as sp
import pyttsx3
import openai


openai.api_key = "sk"

audioo = pyttsx3.init()

def audioTotext(name):
    listener = sp.Recognizer()

    with sp.AudioFile(name) as source:
        audio = listener.record(source)
    try:
        return listener.recognize_google(audio)
    except:
        print("unknown error")

def answer(question):
    response = openai.Completion.create(
        engine = "text-davinci-003",
        prompt=question,
        max_tokens=4000,
        n=1,
       stop=None,
       temperature=0.5    
    )
    return response['choices'][0]['text']

def speakit(text):
    audioo.say(text)
    audioo.runAndWait()

def main():
       while True:
          print("say (hello) and go ahead...")
          with sp.Microphone() as source:
              listener = sp.Recognizer()
              audio = listener.listen(source)
              try:
                  script = listener.recognize_google(audio)
                  if script.lower() == 'hello':
                      name = 'input.wav'
                      print('go ahead im listening...')
                      with sp.Microphone() as source:
                          listener = sp.Recognizer()
                          source.pause_threshold = 1
                          audio = listener.listen(source, phrase_time_limit=None, timeout=None)
                          with open(name, 'wb') as f:
                             f.write(audio.get_wav_data())

                      text = audioTotext(name)
                      if text:
                        print('you said:', text )

                        response = answer(text)
                        print('Hello said:', response)
                        
                        speakit(response)
                  elif text == 'stop':
                    break

              except Exception as e:
                 print('error: {}'.format(e))

main()