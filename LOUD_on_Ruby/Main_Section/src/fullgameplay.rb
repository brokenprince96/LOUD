require 'ruby2d'
# ------------ LOUD ------------
# Intro Game Scene - Done
set background: '#4C4C4C'
set width: 1440
set height: 1024

class Menu
  def initialize
    @title = Image.new(
      'Title.svg',
      x: -355, y: -167,
      width: 1193, height: 679,
      z: 10
    )

    @note = Image.new(
      'note.png',
      x: 695, y: 380,
      width: 62, height: 62,
      rotate: 180,
      z: 10
    )
  end

  def button
    @play = Image.new(
      'Play.svg',
      x: 668, y: 589,
      width: 125, height: 52,
      z: 10
    )

    @credit = Image.new(
      'Credit.svg',
      x: 668, y: 690,
      width: 125, height: 52,
      z: 10
    )
  end
end

#==================================================================================================================
# Selection OST Scene - Done
class OST
  def initialize
    @title = Image.new(
      'Select_OST.svg',
      x: 320, y: 250,
      width: 800.79, height: 50,
      z: 10
    )
  end

  def button
    @ost1 = Image.new(
      'OST1Button.svg',
      x: 657, y: 502,
      width: 125, 
      height: 52
    )
    @ost2 = Image.new(
      'OST2Button.svg', 
      x: 657, y: 597, 
      width: 125, 
      height: 52
      )

    @rewind = Image.new(
      'Rewind.svg',
      x: 0, y: 0,
      width: 357.29,
      height: 98
    )
  end
end
#==================================================================================================================
# Credit Scene - Done
class Credit
  def initialize
    @title = Image.new(
      'Credits.svg',
      x: 392, y: 138, 
      width: 656, 
      height: 473
    )

    @name = Image.new(
      'Isaiah_Casse_Amir_Pone.svg',
      x: 416, y: 621,
      width: 656,
      height: 195.84
    )

    @extra = Image.new(
      'credits2.svg',
      x: 79,
      y: 827,
      width: 1281,
      height: 92.45
    )
  end

  def button
    @rewind = Image.new(
      'Rewind.svg',
      x: 0,
      y: 0,
      width: 357.29,
      height: 98
    )
  end
end

#==================================================================================================================
# Gameplay 1 - OST 1 - Done

KEY_A = 'a'
KEY_S = 's'
KEY_D = 'd'
KEY_J = 'j'
KEY_K = 'k'
KEY_L = 'l'

class Game1
  def initialize
    @notes = []
    @score = 0
    @speed = 5
    @misses = 0
    @score_text = nil
    @feedback_text = nil

    @frames_per_beat = (60.0 / 120 * 60).round

    @song_duration_frames = 129 * 60   # e.g. 129 seconds * 60 fps

    @travel_frames = (914.0 / @speed).ceil
    @frame_count = -@travel_frames

    @lanes = [
      [0,    'A1.svg'],
      [247,  'S2.svg'],
      [495,  'D3.svg'],
      [742,  'J4.svg'],
      [990,  'K5.svg'],
      [1237, 'L6.svg']
    ]

    @beat_chart = [
    [0],                # beat 1  - A
    [2],                # beat 2  - D
    [],                 # beat 3  - rest
    [],                 # beat 4  - rest
    [],                 # beat 5  - rest
    [5],                # beat 6  - L
    [0, 3],             # beat 7  - A + J
    [],                 # beat 8  - rest
    [2, 5],             # beat 9  - D + L
    [4],                # beat 10 - K
    [0, 1, 2, 3, 4, 5], # beat 11 - all lanes
    [0, 1, 2, 3, 4, 5], # beat 12 - all lanes
    [3, 4, 5],          # beat 13 - J + K + L
    [],                 # beat 14 - rest
    [],                 # beat 15 - rest
    [4],                # beat 16 - K
    [],                 # beat 17 - rest
    [3, 5],             # beat 18 - J + L
    [],                 # beat 19 - rest
    [0, 3],             # beat 20 - A + J
    [1, 4],             # beat 21 - S + K
    [2, 5],             # beat 22 - D + L
    [3],                # beat 23 - J
    [2],                # beat 24 - D
    [],                 # beat 25 - rest
    [4],                # beat 26 - K
    [2],                # beat 27 - D
    [1, 3, 5],          # beat 28 - alternating
    [5, 2, 0],          # beat 29 - alternating
    [],                 # beat 30 - rest
    [],                 # beat 31 - rest (song end buffer)
    [],                 # beat 32 - rest (song end buffer)
    ]

    @beat_index = 0

    @music = Music.new('Treat_An_X.wav')
    @music.play
  end

  def song_finished?
    @frame_count >= @song_duration_frames
  end

  def stop_music
    @music.stop if @music
  end

  def button
    # Button A
    @a = Image.new(
      'Button_A.svg',
      x: 0, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    # Button S
    @s = Image.new(
      'Button_S.svg',
      x: 247, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    # Button D
    @d = Image.new(
      'Button_D.svg',
      x: 495, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    # Button J
    @j = Image.new(
      'Button_J.svg',
      x: 742, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    # Button K
    @k = Image.new(
      'Button_K.svg',
      x: 990, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    # Button L
    @l = Image.new(
      'Button_L.svg',
      x: 1237, y: 914,
      width: 203.64, height: 110,
      rotate: 360,
      z: 10,
    )

    @r3 = Image.new(
        'Rewind.svg',
        x: 0, y: 0,
        width: 357.29, height: 98,
        rotate: 360,
        z: 10
    )
  end
  
  def spawn_wave(lane_indices)
    lane_indices.each do |i|
      x_pos, svg = @lanes[i]
      @notes << Image.new(svg, x: x_pos, y: 0, width: 203.64, height: 110, z: 10)
    end
  end

  def show_score
    @score_text.remove if @score_text
    @score_text = Text.new(
      "Score: #{@score}",
      x: 1098, y: 0,
      font: 'NTR-Regular.ttf', 
      size: 20,
      color: 'white',
      z: 10
    )
  end

  def show_feedback(message)
    @feedback_text.remove if @feedback_text
    @feedback_text = Text.new(
      message,
      x: 1098, y: 30,
      font: 'NTR-Regular.ttf', 
      size: 20,
      color: 'white',
      z: 10
    )
  end

  def check_hit(key_x)
    hit_note = @notes.find { |n| n.x == key_x && n.y > 864 && n.y < 964 }
    if hit_note
      @score += 100
      hit_note.remove
      @notes.delete(hit_note)
      show_score
    else
      show_feedback("BOO!!")
    end
  end
 
  def notes
    @notes
  end
 
  def score
    @score
  end
 
  def speed
    @speed
  end

  def misses
    @misses
  end
 
  def beat_chart_done?
    @beat_index >= @beat_chart.length
  end

  def update_notes
    @notes.each do |note|
      note.y += @speed
      if note.y > 1024
        note.remove
        @notes.delete(note)
        @misses += 1
      end
    end

    @frame_count += 1
    if @frame_count % @frames_per_beat == 0
      if @frame_count < @song_duration_frames
        @beat_index = 0 if @beat_index >= @beat_chart.length 
        spawn_wave(@beat_chart[@beat_index])
        @beat_index += 1
      end
    end
 
    @misses >= 65 ? :game_over : nil
  end
end

#==================================================================================================================
#Gameplay 2 - OST 2 - Done
class Game2
  def initialize
    @notes = []
    @score = 0
    @speed = 5
    @misses = 0
    @score_text = nil
    @feedback_text = nil
 
    @frames_per_beat = (60.0 / 120 * 60).round
 
    @song_duration_frames = 113 * 60    # e.g. 113 seconds * 60 fps

    @travel_frames = (914.0 / @speed).ceil
    @frame_count = -@travel_frames
 
    @lanes = [
      [0,    'A1.svg'],
      [247,  'S2.svg'],
      [495,  'D3.svg'],
      [742,  'J4.svg'],
      [990,  'K5.svg'],
      [1237, 'L6.svg']
    ]
 
    @beat_chart = [
    [1],                # beat 1  - S
    [],                 # beat 2  - rest
    [2],                # beat 3  - D
    [3],                # beat 4  - J
    [],                 # beat 5  - rest
    [5],                # beat 6  - L
    [0, 3],             # beat 7  - A + J
    [],                 # beat 8  - rest
    [2, 5],             # beat 9  - D + L
    [4],                # beat 10 - K
    [],                 # beat 11 - rest
    [],                 # beat 12 - rest
    [],                 # beat 13 - rest
    [0, 2, 4],          # beat 14 - alternating
    [1, 3, 5],          # beat 15 - alternating
    [],                 # beat 16 - rest
    [0, 1, 2, 3, 4, 5], # beat 17 - all lanes
    [3, 5],             # beat 18 - J + L
    [],                 # beat 19 - rest
    [0, 3],             # beat 20 - A + J
    [1, 4],             # beat 21 - S + K
    [2, 5],             # beat 22 - D + L
    [0],                # beat 23 - A
    [3],                # beat 24 - J
    [1],                # beat 25 - S
    [4],                # beat 26 - K
    [2],                # beat 27 - D
    [5],                # beat 28 - L
    [5, 2, 0],          # beat 29 - alternating
    [],                 # beat 30 - rest
    [],                 # beat 31 - rest (song end buffer)
    [],                 # beat 32 - rest (song end buffer)
    ]
    @beat_index = 0

    @music = Music.new('shot_my_soul.wav')
    @music.play
  end
 
  def song_finished?
    @frame_count >= @song_duration_frames
  end

  def stop_music
    @music.stop if @music
  end
 
  def button
    # Button A
    @a = Image.new(
      'Button_A.svg',
      x: 0, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    # Button S
    @s = Image.new(
      'Button_S.svg',
      x: 247, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    # Button D
    @d = Image.new(
      'Button_D.svg',
      x: 495, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    # Button J
    @j = Image.new(
      'Button_J.svg',
      x: 742, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    # Button K
    @k = Image.new(
      'Button_K.svg',
      x: 990, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    # Button L
    @l = Image.new(
      'Button_L.svg',
      x: 1237, y: 914,
      width: 203.64, height: 110,
      z: 10
    )
 
    @r4 = Image.new(
      'Rewind.svg',
      x: 0, y: 0,
      width: 357.29, height: 98,
      z: 10
    )
  end
 
  def spawn_wave(lane_indices)
    lane_indices.each do |i|
      x_pos, svg = @lanes[i]
      @notes << Image.new(svg, x: x_pos, y: 0, width: 203.64, height: 110, z: 10)
    end
  end
 
  def show_score
    @score_text.remove if @score_text
    @score_text = Text.new(
      "Score: #{@score}",
      x: 1098, y: 0,
      font: 'NTR-Regular.ttf',
      size: 20,
      color: 'white',
      z: 10
    )
  end
 
  def show_feedback(message)
    @feedback_text.remove if @feedback_text
    @feedback_text = Text.new(
      message,
      x: 1098, y: 30,
      font: 'NTR-Regular.ttf',
      size: 20,
      color: 'white',
      z: 10
    )
  end
 
  def check_hit(key_x)
    hit_note = @notes.find { |n| n.x == key_x && n.y > 864 && n.y < 964 }
    if hit_note
      @score += 100
      hit_note.remove
      @notes.delete(hit_note)
      show_score
    else
      show_feedback("BOO!!")
    end
  end
 
  def notes
    @notes
  end
 
  def score
    @score
  end
 
  def speed
    @speed
  end
 
  def misses
    @misses
  end
 
  def beat_chart_done?
    @beat_index >= @beat_chart.length
  end

  def update_notes
    @notes.each do |note|
      note.y += @speed
      if note.y > 1024
        note.remove
        @notes.delete(note)
        @misses += 1
      end
    end
 
    @frame_count += 1
    if @frame_count % @frames_per_beat == 0
      if @frame_count < @song_duration_frames
        @beat_index = 0 if @beat_index >= @beat_chart.length
        spawn_wave(@beat_chart[@beat_index])
        @beat_index += 1
      
      end
    end
    @misses >= 65 ? :game_over : nil
  end
end
#==================================================================================================================
# Game Over Scene - Done
class Game_Over
  def initialize
    @g_o = Image.new(
        'BOO_Game_Over.svg',
        x: 320, y: 246,
        width: 800.79, height: 138,
        rotate: 360,
        z: 10
    )
  end
  def button
    @reset = Image.new(
        'Reset.svg',
        x: 657, y: 486,
        width: 125, height: 52,
        rotate: 360,
        z: 10
    )

    @quit = Image.new(
        'Quit.svg',
        x: 657, y: 584,
        width: 125, height: 52,
        rotate: 360,
        z: 10
    )
  end
end
#==================================================================================================================
# Winner Scene - Done
class Win
  def initialize(score = 0)
    @win = Image.new(
        'That_was_Legit.svg',
        x: 320, y: 246,
        width: 800.79, height: 138,
        rotate: 360,
        z: 10
    )
    @score_text = Text.new(
      "Final Score: #{score}",
      x: 600, y: 420,
      font: 'NTR-Regular.ttf',
      size: 30,
      color: 'white',
      z: 10
    )
  end
  def button
    @reset = Image.new(
        'Reset.svg',
        x: 657, y: 486,
        width: 125, height: 52,
        rotate: 360,
        z: 10
    )

    @quit = Image.new(
        'Quit.svg',
        x: 657, y: 584,
        width: 125, height: 52,
        rotate: 360,
        z: 10
    )
  end
end
#==================================================================================================================
# Current Scene
$current_scene = Menu.new
$current_scene.button
$last_game = :game1
#==================================================================================================================
# Click Buttons to the Next Scene
on :mouse_down do |event|
  if $current_scene.is_a?(Menu)
    # PLAY button - the caluclation are x + w and y + h
    if event.x.between?(668, 793) && event.y.between?(589, 641)
      clear
      $current_scene = OST.new
      $current_scene.button

    # CREDIT button - the caluclation are x + w and y + h
    elsif event.x.between?(668, 793) && event.y.between?(690, 742)
      clear
      $current_scene = Credit.new
      $current_scene.button
    end

  elsif $current_scene.is_a?(Credit)

  # REWIND button - the caluclation are x + w and y + h
    if event.x.between?(0, 357.29) && event.y.between?(0, 98)
      clear
      $current_scene = Menu.new
      $current_scene.button
    end

  elsif $current_scene.is_a?(OST)
    # REWIND button - the caluclation are x + w and y + h
    if event.x.between?(0, 357.29) && event.y.between?(0, 98)
      clear
      $current_scene = Menu.new
      $current_scene.button
    # OST1 Button
    elsif event.x.between?(657, 782) && event.y.between?(502, 554)
      clear
      $last_game = :game1
      $current_scene = Game1.new
      $current_scene.button
    # OST2 Button
    elsif event.x.between?(657, 782) && event.y.between?(597, 649)
      clear
      $last_game = :game2
      $current_scene = Game2.new
      $current_scene.button
    end

  elsif $current_scene.is_a?(Game1)
    # REWIND Button
    if event.x.between?(0, 357.29) && event.y.between?(0, 98)
      $current_scene.stop_music
      clear
      $current_scene = OST.new
      $current_scene.button
    end
    # REWIND Button
  elsif $current_scene.is_a?(Game2)
    if event.x.between?(0, 357.29) && event.y.between?(0, 98)
      $current_scene.stop_music
      clear
      $current_scene = OST.new
      $current_scene.button
    end

  elsif $current_scene.is_a?(Game_Over)
    # RESET button
    if event.x.between?(657, 782) && event.y.between?(486, 538)
      clear
      $current_scene = $last_game == :game2 ? Game2.new : Game1.new
      $current_scene.button
    end
    
    # QUIT button
    if event.x.between?(657, 782) && event.y.between?(584, 636)
      clear
      $current_scene = OST.new
      $current_scene.button
    end

  elsif $current_scene.is_a?(Win)
    # RESET button
    if event.x.between?(657, 782) && event.y.between?(486, 538)
      clear
      $current_scene = $last_game == :game2 ? Game2.new : Game1.new
      $current_scene.button
    end

    # QUIT button
    if event.x.between?(657, 782) && event.y.between?(584, 636)
      clear
      $current_scene = OST.new
      $current_scene.button
    end
  end
end 
#==================================================================================================================
# Pressing keys for A,S,D,J,K,L
on :key_down do |event|
  if $current_scene.is_a?(Game1) || $current_scene.is_a?(Game2)
    if event.key == KEY_A
      $current_scene.check_hit(0)
    elsif event.key == KEY_S
      $current_scene.check_hit(247)
    elsif event.key == KEY_D
      $current_scene.check_hit(495)
    elsif event.key == KEY_J
      $current_scene.check_hit(742)
    elsif event.key == KEY_K
      $current_scene.check_hit(990)
    elsif event.key == KEY_L
      $current_scene.check_hit(1237)
    end
  end
end
#==================================================================================================================
# Updating the Scene for WINNING and LOSING Scene
update do
  if $current_scene.is_a?(Game1) || $current_scene.is_a?(Game2)
    result = $current_scene.update_notes

    if result == :game_over
      $current_scene.stop_music
      clear
      $current_scene = Game_Over.new
      $current_scene.button
    elsif $current_scene.song_finished? && $current_scene.notes.empty?
      final_score = $current_scene.score
      $current_scene.stop_music
      clear
      $current_scene = Win.new(final_score)
      $current_scene.button
    end
  end
end
#==================================================================================================================
show
